package ${basePackage}.controller.frontend;

import com.yuke.cloud.common.util.wrapper.WrapMapper;
import com.yuke.cloud.common.util.wrapper.Wrapper;
import ${basePackage}.entity.${modelNameUpperCamel};
import ${basePackage}.service.${modelNameUpperCamel}Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.http.MediaType;
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>

import javax.annotation.Resource;
import java.util.List;

/**
* Created by ${author} on ${date}.
*/
@Api(value = "WEB - ${modelNameUpperCamel}Controller", tags = "处理${modelNameUpperCamel}相关请求", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
@RestController
@RequestMapping("${baseRequestMapping}")
<#if superControllerClass??>
public class ${modelNameUpperCamel}Controller extends ${superControllerClass} {
<#else>
public class ${modelNameUpperCamel}Controller {
</#if>
    @Resource
    private ${modelNameUpperCamel}Service ${modelNameLowerCamel}Service;

    @PostMapping("/add")
    @ApiOperation(httpMethod = "POST", value = "新增一条记录")
    public Wrapper add(@ApiParam(name = "${modelNameLowerCamel}", value = "该数据记录的POJO") ${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.save(${modelNameLowerCamel});
        return WrapMapper.ok();
    }

    @PostMapping("/delete")
    @ApiOperation(httpMethod = "POST", value = "根据id删除一条记录")
    public Wrapper delete(@ApiParam(name = "id", value = "记录id") @RequestParam Long id) {
        ${modelNameLowerCamel}Service.deleteById(id);
        return WrapMapper.ok();
    }

    @PostMapping("/update")
    @ApiOperation(httpMethod = "POST", value = "修改一条记录")
    public Wrapper update(@ApiParam(name = "${modelNameLowerCamel}", value = "需要修改的内容") ${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.update(${modelNameLowerCamel});
        return WrapMapper.ok();
    }

    @PostMapping("/detail")
    @ApiOperation(httpMethod = "POST", value = "根据ID获取具体信息")
    public Wrapper<${modelNameUpperCamel}> detail(@ApiParam(name = "id", value = "记录id") @RequestParam Long id) {
        ${modelNameUpperCamel} ${modelNameLowerCamel} = ${modelNameLowerCamel}Service.findById(id);
        return WrapMapper.ok(${modelNameLowerCamel});
    }

    @PostMapping("/list")
    @ApiOperation(httpMethod = "POST", value = "分页获取所有记录")
    public Wrapper<PageInfo<${modelNameUpperCamel}>> list(@ApiParam(name = "page", value = "分页值", defaultValue = "0") @RequestParam(defaultValue = "0") Integer page,
                                                    @ApiParam(name = "size", value = "每分页返回的记录数", defaultValue = "0") @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<${modelNameUpperCamel}> list = ${modelNameLowerCamel}Service.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return WrapMapper.ok(pageInfo);
    }
}
